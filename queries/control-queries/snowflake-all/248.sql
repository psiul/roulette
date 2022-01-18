select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,customer_demographics cd,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and sm.sm_hash >= 18 and sm.sm_hash <= 418 and d.d_hash >= 478 and d.d_hash <= 811 and cd.cd_hash >= 149 and cd.cd_hash <= 899
;
