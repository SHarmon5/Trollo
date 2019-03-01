class List < ApplicationRecord
  belongs_to :board
  
  def self.single_list(board_id, list_id)
    List.find_by_sql(["
      SELECT * 
      FROM lists AS l
      JOIN boards AS b
      ON b.id = l.list_id
      WHERE l.id = ? AND l.board_id = ?",
      list_id, board_id]).first
  end

  # has_many :lists
  def self.all_lists(board_id)
    List.find_by_sql(
      "SELECT *
      FROM lists AS l
      WHERE l.board_id = #{board_id}"
    )
  end

  def self.create_list(p, id)
    List.find_by_sql(["
    INSERT INTO lists (name, board_id, created_at, updated_at)
    VALUES (:name, :board_id, :created_at, :updated_at)
    ", {
      name: p[:name],
      user_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end

  def self.update_list(id, p)
    List.find_by_sql(["
    UPDATE lists AS b
    SET name = ?,
    updated_at = ?
    WHERE b.id = ?;",
    p[:name], DateTime.now, id])
  end

  def self.delete_list(list_id)
    List.find_by_sql(["
      DELETE FROM lists AS b
      WHERE b.id = ?;",
      list_id])
  end

  
end
