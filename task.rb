class Task
  attr_reader :id
  attr_accessor :title, :description, :done

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || 0
  end

  def self.all
    tasks = DB.execute('SELECT * FROM tasks')
    tasks.map { |task| build_task(task) }
  end

  def self.find(id)
    task = DB.execute('SELECT * FROM tasks WHERE id = ?', id).first
    build_task(task)
  end

  def save
    @id.nil? ? create : update
    # @id ? update : create
  end

  def destroy
    DB.execute('DELETE FROM tasks WHERE id = ?', @id)
  end

  def self.build_task(attributes)
    Task.new(
      id: attributes['id'],
      title: attributes['title'],
      description: attributes['description'],
      done: attributes['done']
    )
  end

  private

  def create
    DB.execute('INSERT INTO tasks (title, description) VALUES (?, ?)', @title, @description)
    @id = DB.last_insert_row_id
  end

  def update
    DB.execute('UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = ?', @title, @description, @done, @id)
  end
end
