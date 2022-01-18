select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,customer_demographics cd,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and d.d_hash >= 9 and d.d_hash <= 409 and sm.sm_hash >= 35 and sm.sm_hash <= 785 and cd.cd_hash >= 518 and cd.cd_hash <= 851
;
