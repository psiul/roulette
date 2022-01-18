select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,customer_demographics cd,ship_mode sm
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_hash >= 346 and c.c_hash <= 679 and cd.cd_hash >= 116 and cd.cd_hash <= 516 and sm.sm_hash >= 65 and sm.sm_hash <= 815
;
