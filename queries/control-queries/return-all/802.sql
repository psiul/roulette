select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,customer c,ship_mode sm
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and cd.cd_hash >= 186 and cd.cd_hash <= 586 and d.d_hash >= 43 and d.d_hash <= 793 and c.c_hash >= 394 and c.c_hash <= 727
;
