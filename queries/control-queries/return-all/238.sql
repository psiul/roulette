select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,customer_demographics cd,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 656 and ws.ws_hash <= 989 and c.c_hash >= 104 and c.c_hash <= 504 and d.d_hash >= 110 and d.d_hash <= 860
;
