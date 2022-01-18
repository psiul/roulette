select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,ship_mode sm,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 464 and ws.ws_hash <= 797 and sm.sm_hash >= 490 and sm.sm_hash <= 890 and cd.cd_hash >= 152 and cd.cd_hash <= 902
;
