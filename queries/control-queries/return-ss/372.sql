select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer c,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 525 and hd.hd_hash <= 858 and c.c_hash >= 109 and c.c_hash <= 859 and cd.cd_hash >= 152 and cd.cd_hash <= 552
;
