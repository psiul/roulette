select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,web_returns wr,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 134 and ws.ws_hash <= 467 and d.d_hash >= 54 and d.d_hash <= 804 and cd.cd_hash >= 557 and cd.cd_hash <= 957
;
