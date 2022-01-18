select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,item i,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and sm.sm_hash >= 438 and sm.sm_hash <= 838 and cd.cd_hash >= 176 and cd.cd_hash <= 509 and i.i_hash >= 166 and i.i_hash <= 916
;
