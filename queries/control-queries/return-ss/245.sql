select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 70 and ss.ss_hash <= 820 and i.i_hash >= 505 and i.i_hash <= 838 and cd.cd_hash >= 178 and cd.cd_hash <= 578
;
