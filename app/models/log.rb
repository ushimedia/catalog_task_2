class Log < ApplicationRecord
    belongs_to :user
    has_many :attendances, through: :user
   # enum status: { ログイン: 7001, ログオフ: 7002 }

    def start_time
        self.log_date #self.の後はsimple_calendarに表示させるためのカラムを指定
      end
      
      def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            @log = find_by(id: row['id']) || new
            row_hash = row.to_hash.slice(*CSV_HEADER.keys)
            @log.attributes = row_hash.transform_keys(&CSV_HEADER.method(:[]))
            @log.log_date = @log.log_time
            @log.save!(validate: false)
          
          
       
        end
      end
      
 
   CSV_HEADER = {
    '日付と時刻' => 'log_time',
    'イベント ID' => 'status'
  }.freeze
  
   
end
