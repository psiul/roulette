select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,household_demographics hd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 69 and ss.ss_hash <= 819 and cd.cd_hash >= 182 and cd.cd_hash <= 515 and c.c_hash >= 286 and c.c_hash <= 686
;
