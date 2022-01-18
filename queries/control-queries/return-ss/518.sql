select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 506 and ss.ss_hash <= 906 and i.i_hash >= 199 and i.i_hash <= 949 and cd.cd_hash >= 371 and cd.cd_hash <= 704
;
