# 📋 API Documentation

---

## 🤖 External APIs

<table>
<thead>
<tr>
<th>🔗 API Name</th>
<th>🎯 Purpose</th>
<th>✅ Why Chosen</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>AI Model API</strong></td>
<td>Cardiac data analysis and predictions</td>
<td>
• AI model specialized in cardiology<br>
• Certified for medical use<br>
• Compliant with security standards
</td>
</tr>
</tbody>
</table>

---

## 🔧 Internal API Endpoints

### 🔐 Authentication

<table>
<thead>
<tr>
<th>🛣️ URL Path</th>
<th>📡 Method</th>
<th>📥 Input</th>
<th>📤 Output</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>/auth/login</code></td>
<td><span style="background-color: #28a745; color: white; padding: 2px 8px; border-radius: 4px; font-weight: bold;">POST</span></td>
<td><code>{ "email": string, "password": string }</code></td>
<td><code>{ "token": string }</code></td>
</tr>
</tbody>
</table>

### 🏥 Medical Staff

<table>
<thead>
<tr>
<th>🛣️ URL Path</th>
<th>📡 Method</th>
<th>📥 Input</th>
<th>📤 Output</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>/staff/patients</code></td>
<td><span style="background-color: #007bff; color: white; padding: 2px 8px; border-radius: 4px; font-weight: bold;">GET</span></td>
<td><code>token (header)</code></td>
<td><code>{ "patientList": array }</code></td>
</tr>
<tr>
<td><code>/staff/analysis</code></td>
<td><span style="background-color: #28a745; color: white; padding: 2px 8px; border-radius: 4px; font-weight: bold;">POST</span></td>
<td><code>{ "patientId": string, "data": object }</code></td>
<td><code>{ "analysis": object }</code></td>
</tr>
</tbody>
</table>

### 🫀 Patient Data

<table>
<thead>
<tr>
<th>🛣️ URL Path</th>
<th>📡 Method</th>
<th>📥 Input</th>
<th>📤 Output</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>/patients/data</code></td>
<td><span style="background-color: #007bff; color: white; padding: 2px 8px; border-radius: 4px; font-weight: bold;">GET</span></td>
<td><code>patientId</code></td>
<td><code>{ "cardiacData": object }</code></td>
</tr>
<tr>
<td><code>/patients/history</code></td>
<td><span style="background-color: #007bff; color: white; padding: 2px 8px; border-radius: 4px; font-weight: bold;">GET</span></td>
<td><code>{ "patientId": string, "dateRange": object }</code></td>
<td><code>{ "historicalData": array }</code></td>
</tr>
<tr>
<td><code>/patients/alerts</code></td>
<td><span style="background-color: #28a745; color: white; padding: 2px 8px; border-radius: 4px; font-weight: bold;">POST</span></td>
<td><code>{ "patientId": string, "alertLevel": string }</code></td>
<td><code>{ "status": string }</code></td>
</tr>
</tbody>
</table>
