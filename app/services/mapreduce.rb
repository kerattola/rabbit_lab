class Mapreduce

	def self.counter(s)
		require "docx"

        path = "/tmp/mozilla_attola0/#{s}.docx"
		doc = Docx::Document.open(path)
		
		wordhash = {}

        doc.paragraphs.each do |p|
        	word, count = "#{p}\t1".strip.split

        	if wordhash.has_key?(word)
        		wordhash[word] += count.to_i
        	else
        		wordhash[word] = count.to_i
        	end
        end
        wordhash.each do |record, num|
        	Wordcounter.create(
        		:word      => record,
                :count     => num,
                )
            
        end
       
    end
end