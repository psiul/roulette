select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,ship_mode sm,date_dim d,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 145 and ws.ws_hash <= 478 and cd.cd_hash >= 222 and cd.cd_hash <= 972 and sm.sm_hash >= 141 and sm.sm_hash <= 541
;
