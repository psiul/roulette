select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer_demographics cd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 291 and ss.ss_hash <= 691 and cd.cd_hash >= 186 and cd.cd_hash <= 936 and i.i_hash >= 271 and i.i_hash <= 604
;
