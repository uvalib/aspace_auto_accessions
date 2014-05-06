def blobify(db, s)
  (db.database_type == :derby) ? s.to_sequel_blob : s
end
