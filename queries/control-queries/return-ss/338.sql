select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,item i,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 371 and ss.ss_hash <= 704 and cd.cd_hash >= 90 and cd.cd_hash <= 840 and i.i_hash >= 229 and i.i_hash <= 629
;
