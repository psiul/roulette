select count(ws.ws_item_sk)
from web_sales ws,item i,web_returns wr,customer_demographics cd,reason r
where ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and wr.wr_reason_sk = r.r_reason_sk and ws.ws_hash >= 381 and ws.ws_hash <= 781 and i.i_hash >= 407 and i.i_hash <= 740 and cd.cd_hash >= 126 and cd.cd_hash <= 876
;
