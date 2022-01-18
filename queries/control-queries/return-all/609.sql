select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,household_demographics hd,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 47 and ws.ws_hash <= 380 and d.d_hash >= 0 and d.d_hash <= 750 and hd.hd_hash >= 16 and hd.hd_hash <= 416
;
