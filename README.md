
        <h1>Task Management API</h1>
        <p>
            This is a <strong>Task Management API</strong> built using Laravel. The project allows users to manage tasks with functionalities such as creating, updating, deleting, and viewing tasks. It also includes filters, sorting, and status updates.
        </p>

        <h2>Features</h2>
        <ul>
            <li>User authentication (Laravel UI/Bootstrap)</li>
            <li>Create, update, delete, and retrieve tasks</li>
            <li>Filter tasks by status</li>
            <li>Sort tasks by due date</li>
            <li>Database schema and example Postman requests provided for testing</li>
        </ul>

        <h2>Requirements</h2>
        <ul>
            <li>PHP >= ^10.10</li>
            <li>Composer</li>
            <li>MySQL</li>
            <li>Postman (optional, for API testing)</li>
        </ul>

        <h2>Installation</h2>
        <ol>
            <li><strong>Clone the repository:</strong>
                <pre><code>git clone https://github.com/your-repo/task-management.git
cd task-management</code></pre>
            </li>
            <li><strong>Install dependencies:</strong>
                <pre><code>composer install
npm install</code></pre>
            </li>
            <li><strong>Configure .env:</strong>
                <pre><code>cp .env.example .env</code></pre>
                Then, configure the following variables in <code>.env</code>:
                <pre><code>DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=task_management
DB_USERNAME=your_database_username
DB_PASSWORD=your_database_password</code></pre>
            </li>
            <li><strong>Generate app key:</strong>
                <pre><code>php artisan key:generate</code></pre>
            </li>
            <li><strong>Migrate and seed the database:</strong>
                <pre><code>php artisan migrate --seed</code></pre>
            </li>
            <li><strong>Start the development server:</strong>
                <pre><code>php artisan serve</code></pre>
                Your API will be available at: <a href="http://localhost:8000">http://localhost:8000</a>
            </li>
        </ol>

        <h2>Postman Collection</h2>
        <p>
            A Postman collection is available in the project files: <strong>Taks-Management.postman_collection.json</strong>. 
        </p>
        <h3>Import Postman Collection</h3>
        <ol>
            <li>Open Postman.</li>
            <li>Click on <strong>Import</strong>.</li>
            <li>Select the <code>postman_collection.json</code> file from the project directory.</li>
            <li>Test the available endpoints.</li>
        </ol>

        <h2>Database Schema</h2>
        <p>The database schema file (<code>task_management.sql</code>) is available in the project files. Use it to set up the database structure manually if needed.</p>

        <h2>API Endpoints</h2>
        <table>
            <thead>
                <tr>
                    <th>Method</th>
                    <th>Endpoint</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>GET</td>
                    <td>/api/tasks</td>
                    <td>Get all tasks for the authenticated user</td>
                </tr>
                <tr>
                    <td>POST</td>
                    <td>/api/task/create</td>
                    <td>Create a new task</td>
                </tr>
                <tr>
                    <td>PUT</td>
                    <td>/api/tasks/update/{id}</td>
                    <td>Update an existing task</td>
                </tr>
                <tr>
                    <td>GET</td>
                    <td>/api/task/view/{id}</td>
                    <td>View an existing task</td>
                </tr>
                <tr>
                    <td>DELETE</td>
                    <td>/api/task/delete/{id}</td>
                    <td>Delete a task</td>
                </tr>
            </tbody>
        </table> 