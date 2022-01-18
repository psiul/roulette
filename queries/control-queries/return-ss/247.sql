select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 590 and ss.ss_hash <= 990 and hd.hd_hash >= 214 and hd.hd_hash <= 964 and cd.cd_hash >= 615 and cd.cd_hash <= 948
;
