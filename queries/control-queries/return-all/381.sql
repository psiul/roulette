select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,item i,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 592 and ss.ss_hash <= 925 and cd.cd_hash >= 187 and cd.cd_hash <= 937 and i.i_hash >= 106 and i.i_hash <= 506
;
