select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and i.i_hash >= 211 and i.i_hash <= 611 and cd.cd_hash >= 19 and cd.cd_hash <= 352 and d.d_hash >= 153 and d.d_hash <= 903
;
