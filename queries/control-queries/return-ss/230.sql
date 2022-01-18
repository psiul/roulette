select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 456 and c.c_hash <= 789 and cd.cd_hash >= 40 and cd.cd_hash <= 440 and hd.hd_hash >= 107 and hd.hd_hash <= 857
;
