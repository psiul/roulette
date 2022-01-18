select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,web_returns wr,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 302 and d.d_hash <= 702 and sm.sm_hash >= 146 and sm.sm_hash <= 479 and cd.cd_hash >= 80 and cd.cd_hash <= 830
;
