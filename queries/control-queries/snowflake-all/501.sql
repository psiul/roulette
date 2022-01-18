select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,customer_demographics cd,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 299 and ws.ws_hash <= 699 and d.d_hash >= 196 and d.d_hash <= 946 and hd.hd_hash >= 198 and hd.hd_hash <= 531
;
