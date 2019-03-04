class Task < ApplicationRecord
  belongs_to :task
  
  def self.single_task(task_id)
    Task.find_by_sql([
      "SELECT * 
      FROM tasks AS t
      WHERE t.id = ?",
      task_id]).first
  end

  # has_many :tasks
  def self.all_tasks(id)
    Task.find_by_sql(
      "SELECT *
      FROM tasks AS t
      WHERE t.list_id = #{id}
      ORDER BY t.details"
    )
  end

  def self.create_task(p, id)
    Task.find_by_sql(["
    INSERT INTO tasks (details, complete, list_id, created_at, updated_at)
    VALUES (:details, :complete, :list_id, :created_at, :updated_at)
    ", {
      name: p[:name],
      details: p[:details],
      complete: p[:complete],
      list_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end

  def self.update_task(p, id)
    Task.find_by_sql(["
    UPDATE tasks AS t
    SET details = ?, complete = ?,
    updated_at = ?
    WHERE t.id = ?",
    p[:name], p[:details], p[:complete],
    DateTime.now, id])
  end

  def self.delete_task(task_id)
    Task.find_by_sql(["
      DELETE FROM tasks AS t
      WHERE t.id = ?;",
      task_id])
  end

  
end
