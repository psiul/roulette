select count(ws.ws_item_sk)
from web_sales ws,item i,customer_demographics cd,ship_mode sm,date_dim d
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 118 and ws.ws_hash <= 868 and i.i_hash >= 559 and i.i_hash <= 892 and sm.sm_hash >= 375 and sm.sm_hash <= 775
;
