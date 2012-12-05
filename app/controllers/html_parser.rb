require 'net/http'
require 'nokogiri'
require 'open-uri'

#Event = Struct.new(:speaker, :date, :time, :location, :sponsor)
#def get_html( )
    # Gets the source for all the event pages
    source = Net::HTTP.get(URI('http://illinois.edu/calendar/list/7'))

    # Time for RegEx
    # Look for all strings that match this pattern..
    # http://illinois.edu/calendar/detail/7?eventId=[NUMBERS]
    # within source
    reg = source.scan(/http:\/\/illinois\.edu\/calendar\/detail\/7\?eventId=[0-9]+/)

    event_array = []
    for i in 0..reg.length()-1
        # For every match in reg we append it to the event array
        event_array << reg[i]
    end
    
    # Create an event struct
    Event = Struct.new(:name, :speaker, :date, :time, :location, :sponsor, :cost, :event_t, :desc)

    output = []    

    # NOTE : There are about 550+ events in event_array, it took upwards of 15min to crawl and parse them all.
    # I have a feeling it should be faster than that though
    for i in 0..event_array.length()-1
        # For every event, grab the source of the page
        eventsource = Nokogiri::HTML(open(event_array[i]))

        # array a holds the all the type of applicable attributes on the page(eg. cost, date, etc)
        # array b holds the respective values of each type
        a = eventsource.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "column-label", " " ))]')
        b = eventsource.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "column-info", " " ))]')

        # declare vars outside loop for access
        name = eventsource.css('div#event-wrapper h2').text.to_s.gsub!(/(<[^>]*>)|\n|\t/s) {""}
        date = " "
        location = " "
        sponsor = " "
        speaker = " "
        time = " "
        eventtype = " "
        cost = " "
        desc = eventsource.css("div.description-row").text.to_s

        for i in 0..a.length-1
            if a[i].text.to_s == "Date " date = b[i].text.to_s
            elseif a[i].text.to_s == "Location " location = b[i].text.to_s
            elseif a[i].text.to_s == "Sponsor " sponsor = b[i].text.to_s
            elseif a[i].text.to_s == "Speaker " speaker = b[i].text.to_s
            elseif a[i].text.to_s == "Time " time = b[i].text.to_s
            elseif a[i].text.to_s == "Event type " eventtype = b[i].text.to_s
            elseif a[i].text.to_s == "Cost " cost = b[i].text.to_s

            # to satisfy validates_precense of 
            if eventtype == "" eventtype = "UIUC"
            if location == "" location = "N/A"
        end

        # to remove html tags ------ gsub!(/(<[^>]*>)|\n|\t/s) {""}
        # speaker = eventsource.scan(/Speaker <\/span><span class="column-info">.*+/).to_s.gsub!(/(<[^>]*>)|\n|\t/s) {""}
        # date = eventsource.scan(/Date <\/span><span class="column-info">.*+/).to_s.gsub!(/(<[^>]*>)|\n|\t/s) {""}
        # time = eventsource.scan(/Time <\/span><span class="column-info">.*+/).to_s.gsub!(/(<[^>]*>)|\n|\t/s) {""}
        # location = eventsource.scan(/Location <\/span><span class="column-info">.*+/).to_s.gsub!(/(<[^>]*>)|\n|\t/s) {""}
        # eventtype = eventsource.scan(/Event type <\/span><span class="column-info">.*+/).to_s.gsub!(/(<[^>]*>)|\n|\t/s) {""}
        # sponsor = eventsource.scan(/Sponsor <\/span><span class="column-info">.*+/).to_s.gsub!(/(<[^>]*>)|\n|\t/s) {""}

        new_event = Event.new(name, speaker, date, time, location, sponsor, cost, eventtype, desc)

        output << new_event
    end

# THE PATTERNS THAT LOOP LOOKS FOR
#<h2 class="detail-title">Bio-Interest Group (BIG) Seminars: 'Magnetomotive Optical Coherence Tomography (MM-OCT) ' Principle and Applications'</h2>
#<span class="column-label">Speaker </span><span class="column-info">Jongsik Kim, Ph.D., University of Illinois</span>
#<span class="column-label">Date </span><span class="column-info">Dec 4, 2012</span>
#<span class="column-label">Time </span><span class="column-info">12:00 pm &nbsp; </span>
#<span class="column-label">Location </span><span class="column-info">2005 MEL (Deere Pavilion)</span>
#<span class="column-label">Sponsor </span><span class="column-info">MEL</span>


# what has been done so far:
# This function takes the december event page, loops through it and finds all event URLs
# Then loops through each event URL's html source and finds speaker, time, etc.
# And puts all of those into a struct and puts all the structs into an output array
#
# TO DO - figure out if the array appending adds copies or references
#end
