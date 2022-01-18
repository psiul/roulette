select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 40 and ss.ss_hash <= 440 and hd.hd_hash >= 94 and hd.hd_hash <= 427 and cd.cd_hash >= 91 and cd.cd_hash <= 841
;
