class List < ApplicationRecord
  belongs_to :board
  has_many :tasks
  
  def self.single_list(board_id, list_id)
    List.find_by_sql([
      "SELECT * 
      FROM lists AS l
      WHERE l.id = ?",
      list_id]).first
  end

  # has_many :lists
  def self.all_lists(id)
    List.find_by_sql(
      "SELECT *
      FROM lists AS l
      WHERE l.board_id = #{id}
      ORDER BY l.name"
    )
  end

  def self.create_list(p, id)
    List.find_by_sql(["
    INSERT INTO lists (name, details, due_date, board_id, created_at, updated_at)
    VALUES (:name, :details, :due_date, :board_id, :created_at, :updated_at)
    ", {
      name: p[:name],
      details: p[:details],
      due_date: p[:due_date],
      board_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end

  def self.update_list(p, id)
    List.find_by_sql(["
    UPDATE lists AS l
    SET name = ?, details = ?, due_date = ?,
    updated_at = ?
    WHERE l.id = ?",
    p[:name], p[:details], p[:due_date],
    DateTime.now, id])
  end

  def self.delete_list(list_id)
    List.find_by_sql(["
      DELETE FROM lists AS b
      WHERE b.id = ?;",
      list_id])
  end

  
end
