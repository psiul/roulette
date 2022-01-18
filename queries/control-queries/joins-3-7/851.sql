select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 391 and ss.ss_hash <= 724 and cd.cd_hash >= 176 and cd.cd_hash <= 926 and i.i_hash >= 402 and i.i_hash <= 802
;
