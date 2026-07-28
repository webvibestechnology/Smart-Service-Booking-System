<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cloudflare.com">

<div style="width: 250px; height: 100vh; background-color: #0f172a; color: #ffffff; display: flex; 
flex-direction: column; font-family: 'Segoe UI', sans-serif; position: fixed; left: 0; 
top: 0; box-shadow: 2px 0 8px rgba(0,0,0,0.15); z-index: 1000;">
    <div style="padding: 20px 24px; font-size: 18px; font-weight: 700; 
    border-bottom: 1px solid #1e293b; display: flex; align-items: center; gap: 10px; color: #38bdf8;">
        <i class="fa-solid fa-user-shield"></i> <span>Smart Service</span>
    </div>
    <nav style="flex: 1; padding: 24px 0; overflow-y: auto;">
        <ul style="list-style: none; padding: 0; margin: 0;">
            <li style="padding: 0 24px 10px 24px; font-size: 11px; text-transform: uppercase; 
            color: #475569; font-weight: bold; letter-spacing: 1px;">Links</li>

            <li style="margin-bottom: 4px; padding: 0 12px;">
                <a href="adminDashboard.jsp" style="display: flex; align-items: center; gap: 12px;
                 padding: 12px 16px; color: #ffffff; background-color: #1e293b; text-decoration: none; 
                 border-radius: 8px; font-weight: 600; border-left: 4px solid #38bdf8;">
                    <i class="fa-solid fa-chart-pie" style="width: 20px; color: #38bdf8;"></i> Dashboard
                </a>
            </li>

            <li style="margin-bottom: 4px; padding: 0 12px;">
                <a href="services.jsp" style="display: flex; align-items: center; gap: 12px; padding: 12px 16px; 
                color: #94a3b8; text-decoration: none; border-radius: 8px;
                transition: 0.2s;" onmouseover="this.style.backgroundColor='#1e293b'; this.style.color='#ffffff';
                " onmouseout="this.style.backgroundColor='transparent'; this.style.color='#94a3b8';">
                    <i class="fa-solid fa-screwdriver-wrench" style="width: 20px;"></i> Services
                </a>
            </li>

            <li style="margin-bottom: 4px; padding: 0 12px;">
                <a href="manageBookings.jsp" style="display: flex; align-items: center; gap: 12px;
                padding: 12px 16px; color: #94a3b8; text-decoration: none; border-radius: 8px; transition: 0.2s;
                " onmouseover="this.style.backgroundColor='#1e293b'; this.style.color='#ffffff';
                " onmouseout="this.style.backgroundColor='transparent'; this.style.color='#94a3b8';">
                    <i class="fa-solid fa-list-check" style="width: 20px;"></i> Manage Bookings
                </a>
            </li>

        </ul>
    </nav>


    <div style="padding: 16px; border-top: 1px solid #1e293b;">
        <a href="logout" style="display: flex; align-items: center; justify-content: center; gap: 8px;
         font-weight: 600; transition: 0.2s;" 
         onmouseover="this.style.backgroundColor='#dc2626'" onmouseout="this.style.backgroundColor='#ef4444'">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>

</div>