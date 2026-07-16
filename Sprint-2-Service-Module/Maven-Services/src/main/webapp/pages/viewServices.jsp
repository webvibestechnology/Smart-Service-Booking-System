<!DOCTYPE html>
<html>
<head>
    <title>Services Listing | Smart Service</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>
<body class="bg-light">

    <nav class="navbar">
        <div class="d-flex align-items-center">
            <div class="logo-box me-3"><i class="fa-solid fa-bolt-lightning"></i></div>
            <div>
                <h5 class="m-0 text-white">Smart Service</h5>
                <small style="color: #3b82f6; font-weight: 700;">BOOKING SYSTEM</small>
            </div>
        </div>
    </nav>

    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-md-2 sidebar">
                <h6 class="text-uppercase text-muted fw-bold mb-4">Categories</h6>
                <ul class="list-unstyled">
                    <li class="mb-3"><i class="fa-solid fa-list me-2 text-primary"></i> All Services</li>
                    <li class="mb-3"><i class="fa-solid fa-fan me-2 text-primary"></i> AC Repair</li>
                    <li class="mb-3"><i class="fa-solid fa-wrench me-2 text-primary"></i> Plumbing</li>
                    <li class="mb-3"><i class="fa-solid fa-plug me-2 text-primary"></i> Electrician</li>
                    <li class="mb-3"><i class="fa-solid fa-broom me-2 text-primary"></i> Cleaning</li>
                    <li class="mb-3"><i class="fa-solid fa-laptop me-2 text-primary"></i> Laptop Repair</li>
                    <li class="mb-3"><i class="fa-solid fa-brush me-2 text-primary"></i> Painting</li>
                </ul>
            </div>

            <div class="col-md-10 p-4">
                <div class="mb-4 d-flex gap-2">
                    <input type="text" id="searchInput" class="search-bar" placeholder="🔍 Search services..." onkeyup="filterServices()">
                    <select id="categorySelect" class="form-select" onchange="filterServices()">
                        <option value="all">All Categories</option>
                        <option value="ac">AC Repair</option>
                        <option value="plumbing">Plumbing</option>
                        <option value="electrician">Electrician</option>
                        <option value="cleaning">Cleaning</option>
                        <option value="laptop">Laptop Repair</option>
                        <option value="painting">Painting</option>
                    </select>
                </div>

                <div class="row" id="serviceRow">
                    <div class="col-md-4 mb-4 service-card" data-name="ac"><div class="card p-3"><img src="https://static.vecteezy.com/system/resources/thumbnails/071/837/068/small/technician-repairing-white-wall-mounted-air-conditioner-in-modern-indoor-setting-free-photo.jpg" class="card-img-top rounded" height="180px"><h5 class="mt-3">AC Repair</h5><p class="text-muted m-0">Starting at ₹499</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.5 <small class="text-muted">(120)</small></div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                    <div class="col-md-4 mb-4 service-card" data-name="plumbing"><div class="card p-3"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5Jm2CrpRrK-hoPZL8MLg9LeotVFGtGTqs2BCFOC_nfeEEKMZdj5QeFj7&s=10" class="card-img-top rounded" height="180px"><h5 class="mt-3">Plumbing</h5><p class="text-muted m-0">Starting at ₹299</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.3 <small class="text-muted">(98)</small></div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                    <div class="col-md-4 mb-4 service-card" data-name="electrician"><div class="card p-3"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu9bbiccoQBIpCDcsi5_SLSR57Is2peIc5Qsy6JKmpALLGec5AQCby9c1E&s=10" class="card-img-top rounded" height="180px"><h5 class="mt-3">Electrician</h5><p class="text-muted m-0">Starting at ₹199</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.6 <small class="text-muted">(110)</small></div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                    <div class="col-md-4 mb-4 service-card" data-name="cleaning"><div class="card p-3"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyYKaxdGp40pLNOS2WDrcLuhjYWEtbkjT0aq4lwh8AIYi3U5oXJISkiFtc&s=10" class="card-img-top rounded" height="180px"><h5 class="mt-3">Cleaning</h5><p class="text-muted m-0">Starting at ₹149</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.2 <small class="text-muted">(75)</small></div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                    <div class="col-md-4 mb-4 service-card" data-name="laptop"><div class="card p-3"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU3vvKrTXWUIWgPlu01aOxQC7PlgSywksW6RcXggtKN5O_mFWI3V5AHgc&s=10" class="card-img-top rounded" height="180px"><h5 class="mt-3">Laptop Repair</h5><p class="text-muted m-0">Starting at ₹399</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.4 <small class="text-muted">(88)</small></div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                    <div class="col-md-4 mb-4 service-card" data-name="painting"><div class="card p-3"><img src="https://www.indiapaintingservices.com/assets/images/service/ips-services-20.jpg" class="card-img-top rounded" height="180px"><h5 class="mt-3">Painting</h5><p class="text-muted m-0">Starting at ₹199</p><div class="star-rating my-2"><i class="fa-solid fa-star"></i> 4.1 <small class="text-muted">(60)</small></div><a href="dashboard.jsp" class="btn btn-book">Book Now</a></div></div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function filterServices() {
            let input = document.getElementById('searchInput').value.toLowerCase();
            let category = document.getElementById('categorySelect').value.toLowerCase();
            let cards = document.getElementsByClassName('service-card');
            
            for (let i = 0; i < cards.length; i++) {
                let name = cards[i].getAttribute('data-name');
                if ((name.includes(input) || input === "") && (category === "all" || name === category)) {
                    cards[i].style.display = "";
                    cards[i].scrollIntoView({ behavior: 'smooth', block: 'nearest' });
                } else {
                    cards[i].style.display = "none";
                }
            }
        }
    </script>
</body>
</html>