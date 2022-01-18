select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 2 and ss.ss_hash <= 752 and i.i_hash >= 446 and i.i_hash <= 846 and cd.cd_hash >= 335 and cd.cd_hash <= 668
;
