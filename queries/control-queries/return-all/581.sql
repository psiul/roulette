select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,date_dim d,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 169 and i.i_hash <= 502 and sm.sm_hash >= 131 and sm.sm_hash <= 881 and cd.cd_hash >= 313 and cd.cd_hash <= 713
;
