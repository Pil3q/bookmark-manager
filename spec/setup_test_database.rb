def reset_table
  begin

      con = PG.connect :dbname => ENV['DATABASE']

      con.exec "TRUNCATE bookmarks CASCADE"
      con.exec "TRUNCATE tags CASCADE"

  rescue PG::Error => e

      puts e.message

  ensure

      con.close if con

  end
end
