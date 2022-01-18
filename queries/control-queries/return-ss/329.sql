select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,store_returns sr,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 511 and ss.ss_hash <= 844 and cd.cd_hash >= 226 and cd.cd_hash <= 976 and hd.hd_hash >= 559 and hd.hd_hash <= 959
;
