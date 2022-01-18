select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,date_dim d,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 455 and ws.ws_hash <= 855 and c.c_hash >= 596 and c.c_hash <= 929 and d.d_hash >= 94 and d.d_hash <= 844
;
