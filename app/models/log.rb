class Log < ApplicationRecord
    has_many :users

    def start_time
        self.log_attendance_time #self.の後はsimple_calendarに表示させるためのカラムを指定
      end

      def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
          # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
          @log = find_by(id: row["id"]) || new
          # CSVからデータを取得し、設定する
          @log.attributes = row.to_hash.slice(*updatable_attributes)
          
          # 保存する
        
          @log.save
        end
     end

     def self.updatable_attributes
      ["user_id", "log_leave_time", "log_attendance_time"]
    end
end
