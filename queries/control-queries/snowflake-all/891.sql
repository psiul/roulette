select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,customer_demographics cd,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 68 and ws.ws_hash <= 818 and c.c_hash >= 146 and c.c_hash <= 546 and d.d_hash >= 621 and d.d_hash <= 954
;
