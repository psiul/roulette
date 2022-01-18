select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer_demographics cd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 440 and ss.ss_hash <= 840 and i.i_hash >= 46 and i.i_hash <= 796 and cd.cd_hash >= 615 and cd.cd_hash <= 948
;
