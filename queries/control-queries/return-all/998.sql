select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,customer_demographics cd,web_returns wr
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and i.i_hash >= 63 and i.i_hash <= 463 and d.d_hash >= 483 and d.d_hash <= 816 and cd.cd_hash >= 62 and cd.cd_hash <= 812
;
