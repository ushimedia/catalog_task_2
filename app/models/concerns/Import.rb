module Import
    extend ActiveSupport::Concern
   
    CSV_HEADER = { 
     "日付と時刻" => 'log_time',
     "イベント ID" => 'status'
    }
   
    # 一括登録で使用するuser配列
    logs = []
   
    # 画面に返すエラー
    errors = []
   
    # CSVを1行ずつ解析する
    CSV.foreach(file.path, headers: true, skip_blanks: true).with_index(2) do |row, row_number|
     
     log = Log.new
   
     # CSV_HEADERのキーを基に、hashに変換する
     row_hash = row.to_hash.slice(*CSV_HEADER.keys)
     log.attributes = row_hash.transform_keys(&CSV_HEADER.method(:[]))
   
     if log.valid?
       logs << log
     else
       errors.push({:row_num => row_number, :messages => user.errors.full_messages})
     end
   
    
   
    return errors if errors.present?
   
    # 一括登録
    Log.import logs
   
    return []
   
   end
end
