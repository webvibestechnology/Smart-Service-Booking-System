<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav style="background:#0f172a; padding:16px 60px; display:flex; justify-content:space-between; align-items:center; box-shadow:0 2px 8px rgba(0,0,0,0.2);">

    <a href="${pageContext.request.contextPath}/viewServices"
       style="display:flex;align-items:center;gap:12px;text-decoration:none;color:white;">
        <div style="background:linear-gradient(135deg,#3b82f6,#1d4ed8);width:40px;height:40px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:18px;">
            <i class="fa-solid fa-bolt-lightning"></i>
        </div>
        <div>
            <div style="font-size:18px;font-weight:700;">Smart Service</div>
            <div style="font-size:11px;color:#38bdf8;letter-spacing:1px;">ADMIN PANEL</div>
        </div>
    </a>

    <div style="display:flex;gap:12px;align-items:center;">
        <a href="${pageContext.request.contextPath}/viewServices"
           style="color:#94a3b8;text-decoration:none;font-size:14px;font-weight:500;padding:8px 16px;border-radius:8px;border:1px solid #334155;">
            <i class="fa-solid fa-list"></i> Services
        </a>
        <a href="${pageContext.request.contextPath}/addService"
           style="background:linear-gradient(135deg,#2563eb,#1d4ed8);color:white;text-decoration:none;font-size:14px;font-weight:600;padding:8px 18px;border-radius:8px;">
            <i class="fa-solid fa-plus"></i> Add Service
        </a>
    </div>

</nav>
