import { NodeSDK } from '@opentelemetry/sdk-node';
import { LangfuseSpanProcessor } from '@langfuse/otel';
import { getNodeAutoInstrumentations } from '@opentelemetry/auto-instrumentations-node';
import { resourceFromAttributes } from '@opentelemetry/resources';
import { SEMRESATTRS_SERVICE_NAME, SEMRESATTRS_SERVICE_VERSION } from '@opentelemetry/semantic-conventions';

console.log('[Langfuse] Initializing SDK...');
console.log('[Langfuse] Service:', process.env.OTEL_SERVICE_NAME || 'opencode');

const langfuseProcessor = new LangfuseSpanProcessor();

const sdk = new NodeSDK({
  resource: resourceFromAttributes({
    [SEMRESATTRS_SERVICE_NAME]: process.env.OTEL_SERVICE_NAME || 'opencode',
    [SEMRESATTRS_SERVICE_VERSION]: '1.0.0',
    'deployment.environment': 'local',
  }),
  spanProcessors: [langfuseProcessor],
  instrumentations: [getNodeAutoInstrumentations()],
});

sdk.start();

console.log('[Langfuse] SDK started. Set LANGFUSE_PUBLIC_KEY and LANGFUSE_SECRET_KEY environment variables.');

export const LangfusePlugin = async () => {
  return {};
};
