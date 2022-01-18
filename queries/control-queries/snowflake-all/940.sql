select count(ws.ws_item_sk)
from web_sales ws,customer c,date_dim d,household_demographics hd,customer_demographics cd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 402 and ws.ws_hash <= 735 and c.c_hash >= 403 and c.c_hash <= 803 and d.d_hash >= 211 and d.d_hash <= 961
;
