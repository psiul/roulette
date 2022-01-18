select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 11 and ss.ss_hash <= 761 and d.d_hash >= 369 and d.d_hash <= 769 and cd.cd_hash >= 222 and cd.cd_hash <= 555
;
