select count(ws.ws_item_sk)
from web_sales ws,item i,web_returns wr,reason r,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_reason_sk = r.r_reason_sk and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 626 and ws.ws_hash <= 959 and i.i_hash >= 3 and i.i_hash <= 753 and cd.cd_hash >= 385 and cd.cd_hash <= 785
;
