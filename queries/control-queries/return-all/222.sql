select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,household_demographics hd,date_dim d,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 617 and ws.ws_hash <= 950 and hd.hd_hash >= 185 and hd.hd_hash <= 585 and d.d_hash >= 226 and d.d_hash <= 976
;
