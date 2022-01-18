select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer_demographics cd,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 407 and ss.ss_hash <= 807 and cd.cd_hash >= 49 and cd.cd_hash <= 799 and hd.hd_hash >= 405 and hd.hd_hash <= 738
;
